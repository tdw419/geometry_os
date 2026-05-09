; DESCRIPTION: Places a black 24x52 rectangle at position (301, 200).
; PLAN: r0=301(x), r1=200(y), r2=24(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 200
LDI r2, 24
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
