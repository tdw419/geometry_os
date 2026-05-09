; DESCRIPTION: Places a red 65x59 rectangle at position (32, 134).
; PLAN: r0=32(x), r1=134(y), r2=65(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 134
LDI r2, 65
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
