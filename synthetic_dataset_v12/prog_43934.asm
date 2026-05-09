; DESCRIPTION: Places a yellow 120x18 rectangle at position (275, 163).
; PLAN: r0=275(x), r1=163(y), r2=120(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 163
LDI r2, 120
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
