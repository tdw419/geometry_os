; DESCRIPTION: Places a white 24x74 rectangle at position (177, 96).
; PLAN: r0=177(x), r1=96(y), r2=24(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 96
LDI r2, 24
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
