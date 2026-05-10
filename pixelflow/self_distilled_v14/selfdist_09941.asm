; DESCRIPTION: Renders a red rectangular region spanning 102 by 86 at (394, 143).
; PLAN: r0=394(x), r1=143(y), r2=102(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 143
LDI r2, 102
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
