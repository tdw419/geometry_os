; DESCRIPTION: Renders a magenta box of size 37x65 starting at (59, 143).
; PLAN: r0=59(x), r1=143(y), r2=37(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 143
LDI r2, 37
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
