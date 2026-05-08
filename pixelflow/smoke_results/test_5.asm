; DESCRIPTION : Clear s the screen to bl a ck and the n h al ts .

; re ad RA M 0x 7 000 ( 32 )
; RA M 0x 7 8 20 = RA M 0x 7 8 20 = RA M 0x 7 8 20 = 0x 7 02 = color table ( 16 e nt ri es , R G B )
; RA M 0x 7 8 00 = ac tion color ( 0 .. 0x 7 02 B channel )
; RA M 0x 7 00 = c p res er ves color table ( 16 e nt ri es , for 16 co rre ct each )
; RA M 0x 7 8 00 = c a p b o ar d y
; RA M 0x 7 8 01 = c a m er a_ y
; RA M 0x 7 8 02 = f ra me _ counter
; RA M 0xFF B = ke y bi t m as k
;
; = = = = = Con st an ts = = = =
LDI r11, 1 ; co n st an t 1
LDI r0, 64 ; T IL E S p er a x is
LDI r14, 4 ; ti le p i x el s
LDI r2, 0xFFB ; ke y bi t