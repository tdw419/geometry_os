; DESCRIPTION: Renders a orange box of size 117x46 starting at (307, 180).
; PLAN: r0=307(x), r1=180(y), r2=117(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 180
LDI r2, 117
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
