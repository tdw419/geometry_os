; DESCRIPTION: Places a white 10x77 rectangle at position (140, 177).
; PLAN: r0=140(x), r1=177(y), r2=10(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 177
LDI r2, 10
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
