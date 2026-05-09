; DESCRIPTION: Places a black 120x52 rectangle at position (180, 9).
; PLAN: r0=180(x), r1=9(y), r2=120(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 9
LDI r2, 120
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
