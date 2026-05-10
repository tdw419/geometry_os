; DESCRIPTION: Places a yellow 24x67 rectangle at position (191, 146).
; PLAN: r0=191(x), r1=146(y), r2=24(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 146
LDI r2, 24
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
