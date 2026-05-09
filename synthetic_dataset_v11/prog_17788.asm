; DESCRIPTION: Renders a yellow box of size 103x24 starting at (39, 143).
; PLAN: r0=39(x), r1=143(y), r2=103(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 143
LDI r2, 103
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
