; DESCRIPTION: Renders a white rectangular region spanning 81 by 103 at (168, 152).
; PLAN: r0=168(x), r1=152(y), r2=81(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 152
LDI r2, 81
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
