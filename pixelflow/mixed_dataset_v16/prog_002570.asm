; DESCRIPTION: Places a green 102x36 rectangle at position (190, 192).
; PLAN: r0=190(x), r1=192(y), r2=102(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 192
LDI r2, 102
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
