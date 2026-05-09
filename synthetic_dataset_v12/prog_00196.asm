; DESCRIPTION: Places a yellow 86x39 rectangle at position (135, 28).
; PLAN: r0=135(x), r1=28(y), r2=86(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 28
LDI r2, 86
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
