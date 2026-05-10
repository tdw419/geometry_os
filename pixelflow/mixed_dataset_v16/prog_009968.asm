; DESCRIPTION: Creates a cyan filled rectangle of size 106x33 starting at (267, 181).
; PLAN: r0=267(x), r1=181(y), r2=106(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 181
LDI r2, 106
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
