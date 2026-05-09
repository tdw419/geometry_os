; DESCRIPTION: Renders a yellow box of size 68x65 starting at (327, 174).
; PLAN: r0=327(x), r1=174(y), r2=68(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 174
LDI r2, 68
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
