; DESCRIPTION: Composite: . Then Renders a cyan box of size 99x52 starting at (77, 146). Then Draws a white line from (67, 77) to (171, 15).
; PLAN: r0=77(x), r1=146(y), r2=99(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=67(x1), r1=77(y1), r2=171(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan box of size 99x52 starting at (77, 146).
; PLAN: r0=77(x), r1=146(y), r2=99(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 146
LDI r2, 99
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white line from (67, 77) to (171, 15).
; PLAN: r0=67(x1), r1=77(y1), r2=171(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 77
LDI r2, 171
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
