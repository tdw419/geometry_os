; DESCRIPTION: Places a yellow 41x61 rectangle at position (130, 91).
; PLAN: r0=130(x), r1=91(y), r2=41(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 91
LDI r2, 41
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
