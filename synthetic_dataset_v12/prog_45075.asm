; DESCRIPTION: Places a yellow 39x59 rectangle at position (214, 28).
; PLAN: r0=214(x), r1=28(y), r2=39(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 28
LDI r2, 39
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
