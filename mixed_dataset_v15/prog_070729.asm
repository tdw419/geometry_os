; DESCRIPTION: Renders a magenta box of size 82x93 starting at (327, 134).
; PLAN: r0=327(x), r1=134(y), r2=82(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 134
LDI r2, 82
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
