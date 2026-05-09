; DESCRIPTION: Creates a green rectangular region at (410, 33) spanning 27 by 103 pixels.
; PLAN: r0=410(x), r1=33(y), r2=27(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 33
LDI r2, 27
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
