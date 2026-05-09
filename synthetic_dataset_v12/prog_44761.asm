; DESCRIPTION: Renders a orange box of size 103x47 starting at (362, 129).
; PLAN: r0=362(x), r1=129(y), r2=103(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 129
LDI r2, 103
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
