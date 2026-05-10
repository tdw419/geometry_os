; DESCRIPTION: Places a white 54x41 rectangle at position (29, 144).
; PLAN: r0=29(x), r1=144(y), r2=54(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 144
LDI r2, 54
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
