; DESCRIPTION: Renders a magenta box of size 27x41 starting at (308, 103).
; PLAN: r0=308(x), r1=103(y), r2=27(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 103
LDI r2, 27
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
