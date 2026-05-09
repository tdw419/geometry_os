; DESCRIPTION: Places a cyan 18x95 rectangle at position (200, 18).
; PLAN: r0=200(x), r1=18(y), r2=18(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 18
LDI r2, 18
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
