; DESCRIPTION: Renders a red rectangular region spanning 44 by 16 at (307, 142).
; PLAN: r0=307(x), r1=142(y), r2=44(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 142
LDI r2, 44
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
