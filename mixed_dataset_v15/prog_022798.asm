; DESCRIPTION: Places a orange 93x76 rectangle at position (288, 146).
; PLAN: r0=288(x), r1=146(y), r2=93(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 146
LDI r2, 93
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
