; DESCRIPTION: Places a yellow 70x61 rectangle at position (57, 146).
; PLAN: r0=57(x), r1=146(y), r2=70(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 146
LDI r2, 70
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
