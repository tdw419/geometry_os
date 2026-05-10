; DESCRIPTION: Places a red 18x21 rectangle at position (335, 177).
; PLAN: r0=335(x), r1=177(y), r2=18(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 177
LDI r2, 18
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
