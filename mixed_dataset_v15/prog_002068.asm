; DESCRIPTION: Places a yellow 111x11 rectangle at position (46, 209).
; PLAN: r0=46(x), r1=209(y), r2=111(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 209
LDI r2, 111
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
