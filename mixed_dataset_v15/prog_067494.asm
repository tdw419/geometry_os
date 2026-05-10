; DESCRIPTION: Renders a red rectangular region spanning 59 by 107 at (197, 120).
; PLAN: r0=197(x), r1=120(y), r2=59(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 120
LDI r2, 59
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
