; DESCRIPTION: Places a red 120x32 rectangle at position (9, 146).
; PLAN: r0=9(x), r1=146(y), r2=120(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 146
LDI r2, 120
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
