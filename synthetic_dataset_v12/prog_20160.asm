; DESCRIPTION: Creates a yellow rectangular region at (433, 177) spanning 27 by 30 pixels.
; PLAN: r0=433(x), r1=177(y), r2=27(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 177
LDI r2, 27
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
