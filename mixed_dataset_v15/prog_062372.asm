; DESCRIPTION: Renders a white rectangular region spanning 93 by 59 at (377, 146).
; PLAN: r0=377(x), r1=146(y), r2=93(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 146
LDI r2, 93
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
