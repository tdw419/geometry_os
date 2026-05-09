; DESCRIPTION: Renders a magenta box of size 55x120 starting at (445, 73).
; PLAN: r0=445(x), r1=73(y), r2=55(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 73
LDI r2, 55
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
