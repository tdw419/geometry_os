; DESCRIPTION: Creates a magenta rectangular region at (146, 117) spanning 41 by 112 pixels.
; PLAN: r0=146(x), r1=117(y), r2=41(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 117
LDI r2, 41
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
