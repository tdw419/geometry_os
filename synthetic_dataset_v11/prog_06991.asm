; DESCRIPTION: Places a green 21x41 rectangle at position (219, 96).
; PLAN: r0=219(x), r1=96(y), r2=21(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 96
LDI r2, 21
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
