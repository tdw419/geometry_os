; DESCRIPTION: Places a red 108x41 rectangle at position (43, 174).
; PLAN: r0=43(x), r1=174(y), r2=108(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 174
LDI r2, 108
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
