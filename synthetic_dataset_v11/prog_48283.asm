; DESCRIPTION: Renders a white box of size 61x115 starting at (186, 124).
; PLAN: r0=186(x), r1=124(y), r2=61(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 124
LDI r2, 61
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
