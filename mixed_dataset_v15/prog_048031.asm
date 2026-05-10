; DESCRIPTION: Renders a green box of size 114x47 starting at (368, 146).
; PLAN: r0=368(x), r1=146(y), r2=114(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 146
LDI r2, 114
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
