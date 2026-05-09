; DESCRIPTION: Places a yellow 13x52 rectangle at position (346, 41).
; PLAN: r0=346(x), r1=41(y), r2=13(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 41
LDI r2, 13
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
