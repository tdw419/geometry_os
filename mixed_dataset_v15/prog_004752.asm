; DESCRIPTION: Creates a yellow filled rectangle of size 113x41 starting at (300, 174).
; PLAN: r0=300(x), r1=174(y), r2=113(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 174
LDI r2, 113
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
