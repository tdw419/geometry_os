; DESCRIPTION: Renders a orange box of size 103x77 starting at (350, 177).
; PLAN: r0=350(x), r1=177(y), r2=103(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 177
LDI r2, 103
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
