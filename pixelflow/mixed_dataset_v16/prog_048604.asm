; DESCRIPTION: Renders a yellow box of size 61x90 starting at (174, 117).
; PLAN: r0=174(x), r1=117(y), r2=61(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 117
LDI r2, 61
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
