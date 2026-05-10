; DESCRIPTION: Renders a white box of size 73x96 starting at (135, 146).
; PLAN: r0=135(x), r1=146(y), r2=73(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 146
LDI r2, 73
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
