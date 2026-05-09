; DESCRIPTION: Places a blue 41x99 rectangle at position (439, 117).
; PLAN: r0=439(x), r1=117(y), r2=41(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 117
LDI r2, 41
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
