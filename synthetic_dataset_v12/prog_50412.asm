; DESCRIPTION: Places a yellow 61x11 rectangle at position (244, 146).
; PLAN: r0=244(x), r1=146(y), r2=61(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 146
LDI r2, 61
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
