; DESCRIPTION: Places a yellow 48x91 rectangle at position (109, 55).
; PLAN: r0=109(x), r1=55(y), r2=48(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 55
LDI r2, 48
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
