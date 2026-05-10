; DESCRIPTION: Places a cyan 80x52 rectangle at position (395, 15).
; PLAN: r0=395(x), r1=15(y), r2=80(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 15
LDI r2, 80
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
