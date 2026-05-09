; DESCRIPTION: Renders a magenta box of size 98x34 starting at (146, 154).
; PLAN: r0=146(x), r1=154(y), r2=98(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 154
LDI r2, 98
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
