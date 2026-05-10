; DESCRIPTION: Places a yellow 50x47 rectangle at position (6, 46).
; PLAN: r0=6(x), r1=46(y), r2=50(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 46
LDI r2, 50
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
