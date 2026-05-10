; DESCRIPTION: Renders a white rectangular region spanning 72 by 91 at (294, 131).
; PLAN: r0=294(x), r1=131(y), r2=72(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 131
LDI r2, 72
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
