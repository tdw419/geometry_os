; DESCRIPTION: Renders a yellow box of size 24x116 starting at (410, 120).
; PLAN: r0=410(x), r1=120(y), r2=24(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 120
LDI r2, 24
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
