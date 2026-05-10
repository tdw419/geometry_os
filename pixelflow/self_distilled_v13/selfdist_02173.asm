; DESCRIPTION: Places a cyan 55x20 box at position (375, 50).
; PLAN: r0=375(x), r1=50(y), r2=55(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 50
LDI r2, 55
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
