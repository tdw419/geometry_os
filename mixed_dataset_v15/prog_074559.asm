; DESCRIPTION: Creates a white filled rectangle of size 111x59 starting at (391, 8).
; PLAN: r0=391(x), r1=8(y), r2=111(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 8
LDI r2, 111
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
