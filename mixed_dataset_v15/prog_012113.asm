; DESCRIPTION: Renders a orange rectangular region spanning 99 by 120 at (161, 171).
; PLAN: r0=161(x), r1=171(y), r2=99(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 171
LDI r2, 99
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
