; DESCRIPTION: Places a yellow 12x46 rectangle at position (371, 192).
; PLAN: r0=371(x), r1=192(y), r2=12(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 192
LDI r2, 12
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
